module Paths_game_haskell_ebook (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/mlopezva/Documents/Learning/Haskell/game-haskell-ebook/.cabal-sandbox/bin"
libdir     = "/Users/mlopezva/Documents/Learning/Haskell/game-haskell-ebook/.cabal-sandbox/lib/x86_64-osx-ghc-7.8.4/game-haskell-ebook-0.1.0.0"
datadir    = "/Users/mlopezva/Documents/Learning/Haskell/game-haskell-ebook/.cabal-sandbox/share/x86_64-osx-ghc-7.8.4/game-haskell-ebook-0.1.0.0"
libexecdir = "/Users/mlopezva/Documents/Learning/Haskell/game-haskell-ebook/.cabal-sandbox/libexec"
sysconfdir = "/Users/mlopezva/Documents/Learning/Haskell/game-haskell-ebook/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "game_haskell_ebook_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "game_haskell_ebook_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "game_haskell_ebook_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "game_haskell_ebook_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "game_haskell_ebook_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
