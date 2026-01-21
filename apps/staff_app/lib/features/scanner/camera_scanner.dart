import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraScanner extends StatefulWidget {
  const CameraScanner({super.key});

  @override
  State<CameraScanner> createState() => _CameraScannerState();
}

class _CameraScannerState extends State<CameraScanner> {
  final MobileScannerController _controller = MobileScannerController();

  bool _permissionGranted = true;
  bool _hasPopped = false;
  String? _lastCode;
  DateTime? _lastScanTime;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasPopped) return; // Prevent popping multiple times

    final now = DateTime.now();
    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue;
      if (value == null || value.isEmpty) continue;

      final isDuplicate = (value == _lastCode) &&
          now.difference(_lastScanTime ?? DateTime(0)) <
              const Duration(seconds: 2);
      if (isDuplicate) {
        continue; // Skip rapid duplicate scans
      }

      _lastCode = value;
      _lastScanTime = now;

      // Return value to previous screen
      _hasPopped = true;
      Navigator.of(context).pop(value);
      break;
    }
  }

  void _onPermissionSet(bool granted) {
    setState(() => _permissionGranted = granted);
    if (!granted) {
      // Keep scanner view but show overlay message; user can go back
      // (Android permissions are auto-handled by the plugin; iOS requires Info.plist keys)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Scan Barcode'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
            ),
          ),
          if (!_permissionGranted)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Camera permission required',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please enable camera access in settings.',
                      style: TextStyle(color: Colors.white.withOpacity(0.85)),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Go Back'),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TorchButton(controller: _controller),
                _CameraFlipButton(controller: _controller),
              ],
            ),
          ),
          // Simple scan area hint
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TorchButton extends StatelessWidget {
  final MobileScannerController controller;
  const _TorchButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TorchState>(
      valueListenable: controller.torchState,
      builder: (context, state, _) {
        final isOn = state == TorchState.on;
        return FloatingActionButton.small(
          heroTag: 'torch',
          backgroundColor: Colors.white10,
          foregroundColor: Colors.white,
          onPressed: controller.toggleTorch,
          child: Icon(isOn ? Icons.flash_on : Icons.flash_off),
        );
      },
    );
  }
}

class _CameraFlipButton extends StatelessWidget {
  final MobileScannerController controller;
  const _CameraFlipButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CameraFacing>(
      valueListenable: controller.cameraFacingState,
      builder: (context, facing, _) {
        return FloatingActionButton.small(
          heroTag: 'flip',
          backgroundColor: Colors.white10,
          foregroundColor: Colors.white,
          onPressed: controller.switchCamera,
          child: Icon(
            facing == CameraFacing.front
                ? Icons.camera_front
                : Icons.camera_rear,
          ),
        );
      },
    );
  }
}
