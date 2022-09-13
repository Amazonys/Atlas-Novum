## Includes

Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		DiffuseTexture = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		NormalMap = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 1
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		SpecularMap = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 2
			MipFilter = "Linear"
			MinFilter = "Linear"
		}


	}
}


## Vertex Structs

VertexStruct VS_INPUT
{
    float3 vPosition  : POSITION;
	float2 vTexCoord  : TEXCOORD0;
};


VertexStruct VS_OUTPUT
{
    float4 vPosition : PDX_POSITION;
    float2 vTexCoord : TEXCOORD0;
	float3 vPos		 : TEXCOORD1;
};



## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float4x4 ViewProj;
	float4 vProgress_MoveArmy;
	float4 vDesaturationLengths;
	float fOffsetX;
}

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
		 	VS_OUTPUT Out;
			float4 pos = float4( v.vPosition, 1.0f );
			pos.y += 2.0f;
			pos.x += fOffsetX;
			Out.vPos = pos.xyz;
		   	Out.vPosition  = mul( ViewProj, pos );	
			Out.vTexCoord = v.vTexCoord;
			return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	clip( vProgress_MoveArmy.x - v.vTexCoord.y );
			clip( v.vTexCoord.y - vProgress_MoveArmy.z );
			
			float vPassed = v.vTexCoord.y < vProgress_MoveArmy.y ? 1.0f : 0.0f;

			bool bDesaturate = false;

			bDesaturate = v.vTexCoord.y > vDesaturationLengths.x && v.vTexCoord.y < vDesaturationLengths.y;

			//Tracker to show next province
			float vDividerCheck = v.vTexCoord.y - vProgress_MoveArmy.w;
			//float vDividerCheckX = v.vTexCoord.x - 0.5f;
			if( vDividerCheck > -0.2f && 
				vDividerCheck < 0.2f // && 
				//vDividerCheckX > -0.07f && 
				//vDividerCheckX < 0.07f 
				)
			{
				vPassed = 1.0; //If we are inside the divider, look like we are "filled in"
				bDesaturate = true;
			}
			
			float vArrowPart = 12.0;
			
			float vArrowDiff = v.vTexCoord.y - ( vProgress_MoveArmy.x - vArrowPart );
			float vArrow = saturate( vArrowDiff * 10000.0f );
			float BODY = 0.125;
			float ARROW = 1.0f - BODY;
			float vBodyV = frac( v.vTexCoord.y * 0.00001f ) * BODY;
			float vArrowV = BODY + ( vArrowDiff / vArrowPart ) * ARROW;
			
			//Calculate color
			float4 OutColorBody = tex2D( DiffuseTexture, float2( vBodyV, v.vTexCoord.x * 0.5f ) );
			float4 OutColorBodyPass = tex2D( DiffuseTexture, float2( vBodyV, 0.5f + v.vTexCoord.x * 0.5 ) );
			float4 OutColorArrow = tex2D( DiffuseTexture, float2( vArrowV, v.vTexCoord.x * 0.5f ) );
			float4 OutColorArrowPass = tex2D( DiffuseTexture, float2( vArrowV, 0.5f + v.vTexCoord.x * 0.5 ) );
			float4 OutColor = lerp(
					lerp( OutColorBody, OutColorArrow, vArrow ),
					lerp( OutColorBodyPass, OutColorArrowPass, vArrow ),
					vPassed );


			//Grey out
			if ( bDesaturate )
			{
				float Gray = dot( OutColor.rgb, float3( 0.212671f, 0.715160f, 0.072169f ) ); 
				float vDesaturation = 1.0;
				OutColor.rgb = lerp( OutColor.rgb, float3(Gray, Gray, Gray), vDesaturation );
			}
			
			
			//Calculate normal
			float3 NormalBody = normalize( tex2D( NormalMap, float2( vBodyV, v.vTexCoord.x * 0.5f ) ).rbg  - 0.5f  );
			float3 NormalBodyPass = normalize( tex2D( NormalMap, float2( vBodyV, 0.5f + v.vTexCoord.x * 0.5f ) ).rbg - 0.5f  );
			float3 NormalArrow = normalize( tex2D( NormalMap, float2( vArrowV, v.vTexCoord.x * 0.5f ) ).rbg - 0.5f );
			float3 NormalArrowPass = normalize( tex2D( NormalMap, float2( vArrowV, 0.5f + v.vTexCoord.x * 0.5f ) ).rbg - 0.5f );					
			float3 vNormal = lerp(
					lerp( NormalBody, NormalArrow, vArrow ),
					lerp( NormalBodyPass, NormalArrowPass, vArrow ),
					vPassed );
			vNormal = normalize( vNormal );
			
			//Calculate Specular
			float4 SpecBody = tex2D( SpecularMap, float2( vBodyV, v.vTexCoord.x * 0.5f ) );
			float4 SpecBodyPass = tex2D( SpecularMap, float2( vBodyV, 0.5f + v.vTexCoord.x * 0.5f ) );
			float4 SpecArrow = tex2D( SpecularMap, float2( vArrowV, v.vTexCoord.x * 0.5f ) );
			float4 SpecArrowPass = tex2D( SpecularMap, float2( vArrowV, 0.5f + v.vTexCoord.x * 0.5f ) );					
			float4 vSpecColor = lerp(
					lerp( SpecBody, SpecArrow, vArrow ),
					lerp( SpecBodyPass, SpecArrowPass, vArrow ),
					vPassed );
				
			//Lightning
			OutColor.rgb = CalculateLighting( OutColor.rgb, vNormal );
			
			float vFadeLength = vProgress_MoveArmy.z + 2.0f;
			float vAlpha = v.vTexCoord.y - vFadeLength;
			vAlpha = vAlpha * saturate( 1.0f - ( vAlpha/-vFadeLength ) );
			
			return float4( OutColor.rgb, OutColor.a * saturate( vAlpha ) );
			//return float4( ComposeSpecular( OutColor.rgb, CalculateSpecular( v.vPos, vNormal, ( vSpecColor.a * 2.0f ) ) ), OutColor.a );
		}
	]]

}


## Blend States

BlendState BlendState
{
	SourceBlend = "SRC_ALPHA"
	AlphaTest = no
	BlendEnable = yes
	DestBlend = "INV_SRC_ALPHA"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect ArrowEffect
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}