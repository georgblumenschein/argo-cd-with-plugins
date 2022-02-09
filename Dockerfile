ARG ARGOCD_VERSION=v2.2.5
FROM curlimages/curl as builder

ARG ARGOCD_VAULT_PLUGIN_VERSION=1.8.0

RUN curl -L -o /home/curl_user/argocd-vault-plugin https://github.com/argoproj-labs/argocd-vault-plugin/releases/download/v$ARGOCD_VAULT_PLUGIN_VERSION/argocd-vault-plugin_${ARGOCD_VAULT_PLUGIN_VERSION}_linux_amd64 \
  && chmod +x /home/curl_user/argocd-vault-plugin

FROM argoproj/argocd:$ARGOCD_VERSION

COPY --from=builder --chown=0:0 /home/curl_user/argocd-vault-plugin /usr/local/bin/argocd-vault-plugin