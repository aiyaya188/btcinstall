FROM buildpack-deps:jessie-curl
ADD bitcoin-23.0-x86_64-linux-gnu.tar.gz ./
RUN cd bitcoin-23.0/bin \
        && mv bitcoin-cli bitcoin-tx bitcoind bitcoin-wallet /usr/local/bin \
        && cd / \
        && rm -Rfv bitcoin*
EXPOSE 8332 8333 18332 18333 18443 18444
WORKDIR /root/.bitcoin
ENTRYPOINT ["bitcoind"]
