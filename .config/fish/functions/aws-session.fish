function aws-session
    set -l profile $argv[1]

    if test -z "$profile"
        echo "Usage: aws-session <profile>"
        return 1
    end

    # Try to get credentials; if session is expired, login first
    set -l creds (aws configure export-credentials --profile $profile --format env 2>/dev/null | string replace "export " "")

    if test -z "$creds"
        aws sso login --profile $profile; or return 1
        set creds (aws configure export-credentials --profile $profile --format env 2>/dev/null | string replace "export " "")
    end

    if test -z "$creds"
        echo "Failed to get credentials for profile: $profile"
        return 1
    end

    env $creds AWS_PROFILE=$profile AWS_VAULT=$profile fish
end

