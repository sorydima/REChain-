Write-Output "$WINDOWN_PFX"
Move-Item -Path $WINDOWS_PFX -Destination rechainonline.pem
certutil -decode rechainonline.pem rechainonline.pfx

flutter pub run msix:create -c rechainonline.pfx -p $WINDOWS_PFX_PASS --sign-msix true --install-certificate false
