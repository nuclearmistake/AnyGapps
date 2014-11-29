#!/bin/sh
# Eric McCann (Nuclearmistake) 2014
export VERBOSE=1
#export VERBOSE_GENERATION=1

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
if [ $VERBOSE_GENERATION ] && [ $OUTFD ]; then
    generate_gapps_script | tee /system/addon.d/70-gapps.sh | while read LINE; do ui_print $LINE; done
else
    generate_gapps_script > /system/addon.d/70-gapps.sh
fi

# copy data files into place (if there are any)
[ -e /tmp/data ] && copy_files /tmp/data /data
