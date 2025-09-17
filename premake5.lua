project "assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    warnings "Off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/**.h",
        "code/**.h",
        "code/**.cpp",
        "code/**.c"
    }

    includedirs {
        "include",
        "code",
        "contrib",
        "contrib/irrXML",
        "contrib/unzip",
        "contrib/zlib",
        "contrib/rapidjson/include",
        "contrib/pugixml/src",
        "contrib/utf8cpp/source"
    }

    defines { "ASSIMP_BUILD_NO_EXPORT" }

    filter "system:windows"
        systemversion "latest"
        defines { "_CRT_SECURE_NO_WARNINGS" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "Speed"

    filter "configurations:Dist"
        runtime "Release"
        optimize "Speed"
