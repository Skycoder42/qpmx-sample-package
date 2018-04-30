import "basemod/QpmxModule.qbs" as QpmxModule

QpmxModule {
	Depends { name: "Qt.network" }
	cpp.defines : ["QPMX_TEST_AVAILABLE"]
}
