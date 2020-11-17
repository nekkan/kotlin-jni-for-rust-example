@echo off

REM  You need to have rustup installed in your machine.
where rustup >NUL

REM  Checks if an error occurred due to the last command.
if %ERRORLEVEL% neq 0 (
    echo "Command `rustup` not found. Make sure you have rustup installed in your machine."
    exit /b 1
)

cd /d .. >NUL
cd /d src >NUL
cd /d main >NUL
cd /d rust

REM  Checks if the past exists.
if %ERRORLEVEL% neq 0 exit /b 1

rustup target add armv7-linux-androideabi   # for arm
rustup target add i686-linux-android        # for x86
rustup target add aarch64-linux-android     # for arm64
rustup target add x86_64-linux-android      # for x86_64
rustup target add x86_64-unknown-linux-gnu  # for linux-x86-64
rustup target add x86_64-apple-darwin       # for darwin (macOS)
rustup target add x86_64-pc-windows-gnu     # for win32-x86-64-gnu
rustup target add x86_64-pc-windows-msvc    # for win32-x86-64-msvc