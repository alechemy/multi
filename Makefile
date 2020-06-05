SWIFT_CONFIGURATION := debug
SWIFT_BUILD_PATH = .build/x86_64-apple-macosx/$(SWIFT_CONFIGURATION)

.PHONY: Multi.app
Multi.app: Multi.app/Preferences Multi.app/Contents/Resources/Stub Multi.app/Contents/Resources/Runtime

Multi.app/Preferences: $(SWIFT_BUILD_PATH)/Preferences
	cp $^ $@
Multi.app/Contents/Resources/Stub: $(SWIFT_BUILD_PATH)/Stub
	cp $^ $@
Multi.app/Contents/Resources/Runtime: $(SWIFT_BUILD_PATH)/Runtime
	cp $^ $@

$(SWIFT_BUILD_PATH)/%: Sources/%/*.swift Sources/Shared/*.swift
	swift build --product $*
