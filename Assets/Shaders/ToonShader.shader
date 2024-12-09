Shader "Custom/ToonShader"
{
    
    Properties
    {
        //Textures
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex("Main Texture", 2D) = "white" {}
        
        //Colour Range
        _RampText("Ramp Texture", 2D) = "white" {}
        
    }
    SubShader
    {
        Tags{"RenderType"="Opaque"}

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf ToonRamp
        //#pragma surface surf Lambert


        sampler2D _MainTex;
        float4 _Color;
        
        sampler2D _RampText;

        float4 LightingToonRamp(SurfaceOutput s, fixed3 lightdir, fixed atten)
        {
            float diff= dot(s.Normal, lightdir);
            float h = diff * 1 + 0.4;
            float2 rh = h;
            float3 ramp = tex2D(_RampText, rh).rgb;

            float4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
            c.a = s.Alpha;
            return c;


        }

        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
                   

            
            o.Albedo = (tex2D(_MainTex, IN.uv_MainTex)) * _Color.rgb;
            

            //o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
