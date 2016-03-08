{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Foreign.LibFFI.Closure.Internal where

#include <ffi.h>

data FFI_Closure

sizeOf_ffi_closure :: Int
sizeOf_ffi_closure = #(size ffi_closure)


foreign import ccall ffi_closure_alloc :: CSize -> Ptr (Ptr ()) -> IO (Ptr FFI_Closure)


foreign import ccall ffi_closure_free :: Ptr () -> IO ()

foreign import ccall ffi_prep_closure_loc :: Ptr FFI_Closure -> Ptr CIF ->
                         Ptr () -> Ptr () -> Ptr () -> IO Int
