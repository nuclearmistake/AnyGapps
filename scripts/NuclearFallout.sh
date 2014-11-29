#!/bin/sh
# Eric McCann (Nuclearmistake) 2014

always_clean() {
cat <<EOF
/system/app/Provision/Provision.apk
/system/app/QuickSearchBox/QuickSearchBox.apk
/system/app/priv-app/SetupWizard/SetupWizard.apk
/system/app/priv-app/Velvet/Velvet.apk
/system/app/Vending/Vending.apk
/system/app/BrowserProviderProxy/BrowserProviderProxy.apk
/system/app/PartnerBookmarksProver/PartnerBookmarksProvider.apk
EOF
}

always_clean | while read FILE; do
    rm -f $FILE
done

. /tmp/NuclearFalloutHelpers.sh

# copy system files into place AND generate 70-gapps.sh while we do
backuptool_header
copy_files /tmp/system /system
backuptool_footer

# copy data files into place (if there are any)
[ -e /tmp/data ] && ( export NO_BACKUP=1 && copy_files /tmp/data /data )
