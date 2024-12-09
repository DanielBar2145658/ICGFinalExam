Shader "Custom/VertexColouring"
{
        Properties
    {

        _Speed ("Scroll 1", Range(0,100)) = 1
        _Speed2 ("Scroll 2", Range(0,100)) = 1
        _Speed3 ("Scroll 3", Range(0,100)) = 1

    }
    SubShader
    {
    

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            { 
                float4 color: COLOR;
                float4 vertex : SV_POSITION;
            };

            float _Speed;
            float _Speed2;
            float _Speed3;



            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color.r = v.vertex.z < 1?0 : sin(_Speed * _Time.y);
                o.color.g =  sin(_Speed2 * _Time.y );
                o.color.b = sin(_Speed3 * _Time.y );
                o.color.a = 1;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = i.color;
                return col;
            }
            ENDCG
        }
    }
}
