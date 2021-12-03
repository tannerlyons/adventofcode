{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_advent_solutions2021 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/tlyons/git/adventofcode/2021/.stack-work/install/x86_64-linux/cdb87a1f446242657572682762664f62272e01aa1691d803a5e7b6c2749e8ddf/8.10.7/bin"
libdir     = "/home/tlyons/git/adventofcode/2021/.stack-work/install/x86_64-linux/cdb87a1f446242657572682762664f62272e01aa1691d803a5e7b6c2749e8ddf/8.10.7/lib/x86_64-linux-ghc-8.10.7/advent-solutions2021-0.1.0.0-IxUcWGwcY2SOXGonPxWed-advent-solutions2021-test"
dynlibdir  = "/home/tlyons/git/adventofcode/2021/.stack-work/install/x86_64-linux/cdb87a1f446242657572682762664f62272e01aa1691d803a5e7b6c2749e8ddf/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/tlyons/git/adventofcode/2021/.stack-work/install/x86_64-linux/cdb87a1f446242657572682762664f62272e01aa1691d803a5e7b6c2749e8ddf/8.10.7/share/x86_64-linux-ghc-8.10.7/advent-solutions2021-0.1.0.0"
libexecdir = "/home/tlyons/git/adventofcode/2021/.stack-work/install/x86_64-linux/cdb87a1f446242657572682762664f62272e01aa1691d803a5e7b6c2749e8ddf/8.10.7/libexec/x86_64-linux-ghc-8.10.7/advent-solutions2021-0.1.0.0"
sysconfdir = "/home/tlyons/git/adventofcode/2021/.stack-work/install/x86_64-linux/cdb87a1f446242657572682762664f62272e01aa1691d803a5e7b6c2749e8ddf/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "advent_solutions2021_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "advent_solutions2021_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "advent_solutions2021_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "advent_solutions2021_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "advent_solutions2021_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "advent_solutions2021_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
