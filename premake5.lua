project "SPIRV-Cross"
	kind "StaticLib"
	language "C++"
    cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "GLSL.std.450.h",
		"spirv_common.hpp",
		"spirv_cross_containers.hpp",
		"spirv_cross_error_handling.hpp",
		"spirv.hpp",
		"spirv_cross.hpp",
		"spirv_cross.cpp",
		"spirv_parser.hpp",
		"spirv_parser.cpp",
		"spirv_cross_parsed_ir.hpp",
		"spirv_cross_parsed_ir.cpp",
		"spirv_cfg.hpp",
		"spirv_cfg.cpp",
	}

	filter "system:windows"
		systemversion "latest"

		defines 
		{
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"