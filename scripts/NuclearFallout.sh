#!/bin/sh
# Eric McCann (Nuclearmistake) 2014

always_clean() {
cat <<EOF
/system/app/Provision.apk
/system/app/QuickSearchBox.apk
/system/app/priv-app/SetupWizard.apk
/system/app/priv-app/Velvet.apk
/system/app/Vending.apk
/system/app/BrowserProviderProxy.apk
/system/app/PartnerBookmarksProvider.apk
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
copy_files /tmp/data /data
