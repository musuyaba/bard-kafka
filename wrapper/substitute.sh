#!/bin/sh
# Uncomment the line below to check the environment variables from the host
# env

# Change env on broker
if [ -e /wrapper/modify-broker-env-done ]; then
    echo "/wrapper/modify-broker-env-done already exists. Skipping modification."
else
    apk --no-cache add gettext
    # Substitute variables in the template file
    envsubst </wrapper/wrapper-broker.sh.template >/wrapper/wrapper-broker.sh

    touch /wrapper/modify-broker-env-done
    # Display the modified file
    cat /wrapper/wrapper-broker.sh
fi
