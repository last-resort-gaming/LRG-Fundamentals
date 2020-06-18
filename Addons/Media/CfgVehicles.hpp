class CfgVehicles {
    class Flag_White_F;
    class LRG_Flag_White: Flag_White_F
    {
        author="Mokka";

        editorPreview="\z\LRG Fundamentals\addons\media\images\LRG_Flag_White.paa";
        _generalMacro="LRG_Flag_White";
        displayName="Flag (Last Resort Gaming, White)";
        class EventHandlers
        {
            init="(_this select 0) setFlagTexture ""\z\LRG Fundamentals\addons\media\images\LRG_Flag_White.paa""";
        };
    };
    class LRG_Flag_Black: Flag_White_F
    {
        author="Mokka";

        editorPreview="\z\LRG Fundamentals\addons\media\images\LRG_Flag_Black.paa";
        _generalMacro="LRG_Flag_Black";
        displayName="Flag (Last Resort Gaming, Black)";
        class EventHandlers
        {
            init="(_this select 0) setFlagTexture ""\z\LRG Fundamentals\addons\media\images\LRG_Flag_Black.paa""";
        };
    };
};