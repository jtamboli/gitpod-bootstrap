FROM swift AS swift
USER gitpod
FROM gitpod/workspace-full
COPY --from=swift /usr/bin/swift-api-digester /usr/bin/llvm-cov /usr/bin/repl_swift /usr/bin/plutil /usr/bin/swift-package /usr/bin/swift-build-tool /usr/bin/clang /usr/bin/clang-7 /usr/bin/llvm-profdata /usr/bin/swift /usr/bin/swift-build /usr/bin/swift-run /usr/bin/clang-cpp /usr/bin/lldb /usr/bin/clang-cl /usr/bin/swift-test /usr/bin/lldb-argdumper /usr/bin/swift-api-checker.py /usr/bin/swift-autolink-extract /usr/bin/swiftc /usr/bin/lldb-server /usr/bin/sourcekit-lsp /usr/bin/swift-demangle /usr/bin/clangd /usr/bin/clang++ /usr/bin/
COPY --from=swift /usr/lib/libIndexStore.so /usr/lib/libsourcekitdInProc.so /usr/lib/libIndexStore.so.7svn /usr/lib/libBlocksRuntime.so /usr/lib/liblldb.so.7.0.0svn /usr/lib/liblldb.so /usr/lib/liblldb.so.7svn /usr/lib/libswiftDemangle.so /usr/lib/libdispatch.so /usr/lib/
COPY --from=swift /usr/bin/sdk-module-lists/ /usr/bin/sdk-module-lists/
COPY --from=swift /usr/lib/clang/ /usr/lib/clang/
COPY --from=swift /usr/lib/swift/ /usr/lib/swift/
COPY --from=swift /usr/lib/swift_static/ /usr/lib/swift_static/
COPY --from=swift /usr/local/include/indexstore/ /usr/local/include/indexstore/
COPY --from=swift /usr/share/man/man1/swift.1 /usr/share/man/man1/
COPY --from=swift /usr/share/swift/ /usr/share/swift/
COPY --from=swift /usr/share/icuswift/ /usr/share/icuswift/
COPY --from=swift /usr/share/doc/swift/ /usr/share/doc/swift/
COPY --from=swift /usr/include/SourceKit/ /usr/include/SourceKit/
COPY --from=swift /usr/include/c++/ /usr/include/c++/
COPY --from=swift /usr/include/unicode/ /usr/include/unicode/
RUN sudo apt-get update -q && \
    sudo apt-get install -yq libtinfo5 libcurl4-openssl-dev libncurses5 && \
    sudo rm -rf /var/lib/apt/lists/*
