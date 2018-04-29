import qbs

Project {
	minimumQbsVersion: "1.7.1"

	CppApplication {
		id: test
		Depends { name: "Qt.core" }
		Depends { name: "qpmx" }

		cpp.cxxLanguageVersion: "c++11"
		cpp.defines: [
			"QT_DEPRECATED_WARNINGS",
		]

		qpmx.logLevel: "verbose"
		qpmx.stderr: true
		qpmx.devCache: "/tmp"

		files: [
			"baum.cpp",
			"main.cpp",
			"extra_de.ts",
			"qpmx.json",
			"qpmx.json.src",
			"qpmx.json.user.cm"
		]

		Group {
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
	}
}
