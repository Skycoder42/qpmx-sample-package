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
		qpmx.forwardStderr: true
		qpmx.autoProbe: false

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

			//TODO install translations
		}

		Group {
			fileTagsFilter: "qm"
			qbs.install: true
			qbs.installDir: "translations"
		}
	}

	StaticLibrary {
		id: testLib
		name: "test-static-lib"
		type: ["staticlibrary-merged"]

		Depends {
			name: "Qt"
			submodules: ["core", "gui", "widgets"]
		}
		Depends { name: "qpmx" }

		Group {
			fileTagsFilter: "staticlibrary-merged"
			qbs.install: true
			qbs.installDir: "lib"
		}

		cpp.cxxLanguageVersion: "c++11"
		cpp.defines: [
			"QT_DEPRECATED_WARNINGS",
		]

		qpmx.logLevel: "verbose"
		qpmx.forwardStderr: true
		qpmx.autoProbe: false

		files: [
			"baum.cpp",
			"main.cpp",
			"qpmx.json"
		]
	}
}
