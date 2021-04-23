import 'dart:ffi' ; // For FFI
import 'dart:io'; // For Platform.isX
import 'package:ffi/ffi.dart';


//typedef _process = Int32 Function(Pointer<Utf8>);
//typedef _Process = Int32 Function(Pointer<Utf8>);


final DynamicLibrary _lib = Platform.isAndroid
    ? DynamicLibrary.open("libnative_opencv.so")
    : DynamicLibrary.process();



//Process Pointer
final Pointer<Int32> Function(Pointer<Utf8> filename) process =
_lib
    .lookup<NativeFunction<Pointer<Int32> Function(Pointer<Utf8>)>>("process")
    .asFunction();


List<int> process1(String filename) {
  return process(Utf8.toUtf8(filename)).asTypedList(10);
}


//Working Process
//final int Function(Pointer<Utf8> filename) process =
//_lib
//    .lookup<NativeFunction<Int32 Function(Pointer<Utf8>)>>("process")
//    .asFunction();


/*Working Native Add
final int Function(int x, int y) nativeAdd =
_lib
    .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
    .asFunction();
*/






//
//final _Process __process = _lib
//    .lookup<NativeFunction<_process>>("process")
//    .asFunction();

//Int32 process (String filename) {
//  __process(Utf8.toUtf8(filename));
//}

