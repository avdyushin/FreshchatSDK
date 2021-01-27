PROJECT_NAME=FreshchatSDK

all: build-macosx build-iphoneos build-iophonesimulator build-xcframework


build-macosx: 
	xcodebuild archive \
		-project $(PROJECT_NAME).xcodeproj \
		-scheme $(PROJECT_NAME) \
		-sdk macosx \
		-archivePath build/$(PROJECT_NAME)-macosx.xcarchive

build-iphoneos: 
	xcodebuild archive \
		-project $(PROJECT_NAME).xcodeproj \
		-scheme $(PROJECT_NAME) \
		-sdk iphoneos \
		-archivePath build/$(PROJECT_NAME)-iphoneos.xcarchive

build-iophonesimulator:
	xcodebuild archive \
		-project $(PROJECT_NAME).xcodeproj \
		-scheme $(PROJECT_NAME) \
		-sdk iphonesimulator \
		-archivePath build/$(PROJECT_NAME)-iphonesimulator.xcarchive

build-xcframework:
	xcodebuild \
		-create-xcframework \
		-framework build/$(PROJECT_NAME)-macosx.xcarchive/Products/Library/Frameworks/$(PROJECT_NAME).framework \
		-framework build/$(PROJECT_NAME)-iphoneos.xcarchive/Products/Library/Frameworks/$(PROJECT_NAME).framework \
		-framework build/$(PROJECT_NAME)-iphonesimulator.xcarchive/Products/Library/Frameworks/$(PROJECT_NAME).framework \
		-output build/$(PROJECT_NAME).xcframework

clean:
	rm -fr build/
