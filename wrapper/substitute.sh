#!/bin/sh
# Uncomment the line below to check the environment variables from the host
# env

# Change env on broker
ITERATIONS=${BROKERS}

i=1

while [ "$i" -le "$ITERATIONS" ]; do
    FILE_PATH="/wrapper/modify-broker-env-done-$i"

    if [ -e "$FILE_PATH" ]; then
        echo "$FILE_PATH already exists. Skipping modification."
    else
        # Check if gettext is already installed
        if ! apk info -q gettext; then
            # Install gettext if not installed
            apk --no-cache add gettext
        fi
        # Substitute variables in the template file
        envsubst </wrapper/wrapper-broker.sh.template > "/wrapper/wrapper-broker-$i.sh"

        touch "$FILE_PATH"
        # Display the modified file
        cat "/wrapper/wrapper-broker-$i.sh"
    fi

    i=$((i + 1))
done
