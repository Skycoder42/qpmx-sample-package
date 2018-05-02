import qbs

Project {
	minimumQbsVersion: "1.7.1"

	CppApplication {
		id: testApp
		name: "test-app"

		Depends {
			name: "Qt"
			submodules: ["core", "gui", "widgets"]
		}
		Depends { name: "qpmx" }

		cpp.cxxLanguageVersion: "c++11"
		cpp.defines: [
			"QT_DEPRECATED_WARNINGS",
		]

		qpmx.logLevel: "verbose"

		files: [
			"baum.cpp",
			"main.cpp",
			"extra_de.ts",
			"qpmx.json",
			"qpmx.json.src",
			"qpmx.json.user.cm"
		]

		Group {
			name: "translations"
			fileTags: ["qpmx-ts"]
			files: [
				"test_de.ts",
				"test_en.ts"
			]
		}

		Group {
			fileTagsFilter: "application"
			qbs.install: true
		}

		Group {
			fileTagsFilter: "qm"
			qbs.install: true
			qbs.installDir: "translations"
		}
	}

	MergedStaticLibrary {
		id: testLib
		name: "test-static-lib"

		Depends {
			name: "Qt"
			submodules: ["core", "gui", "widgets"]
		}
		Depends { name: "qpmx" }

		cpp.cxxLanguageVersion: "c++11"
		cpp.defines: [
			"QT_DEPRECATED_WARNINGS",
		]

		qpmx.logLevel: "verbose"

		files: [
			"baum.cpp",
			"main.cpp",
			"qpmx.json"
		]

		Group {
			fileTagsFilter: "qpmx-staticlibrary-merged"
			qbs.install: true
			qbs.installDir: "lib"
		}
	}
}
