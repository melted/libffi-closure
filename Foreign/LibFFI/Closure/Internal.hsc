{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Foreign.LibFFI.Closure.Internal where

import Foreign.Ptr

#include <ffi.h>

data FFI_Closure
data CodeLoc

sizeOf_ffi_closure :: Int
sizeOf_ffi_closure = #(size ffi_closure)


foreign import ccall ffi_closure_alloc :: CSize -> Ptr (Ptr CodeLoc) -> IO (Ptr FFI_Closure)


foreign import ccall ffi_closure_free :: Ptr FFI_Closure -> IO ()

foreign import ccall ffi_prep_closure_loc :: Ptr FFI_Closure -> Ptr CIF ->
                         Ptr () -> Ptr () -> Ptr CodeLoc -> IO C_ffi_status
