## Includes

Includes = {

}


## Samplers

PixelShader = 
{
	Samplers = 
	{

	}
}


## Vertex Structs

VertexStruct VS_INPUT
{
    float4 vPosition	: POSITION;
    float4 vColor		: PDX_COLOR;
};


VertexStruct VS_OUTPUT
{
    float4  vPosition : PDX_POSITION;
	float4  vColor	  : TEXCOORD0;
};


## Constant Buffers

ConstantBuffer( 0, 0 )
{
	float4x4 Matrix;//			: register( c0 );
}

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShaderDebugLines
	[[
		VS_OUTPUT main(const VS_INPUT In )
		{
		    VS_OUTPUT Out;
		    Out.vPosition  	= mul( Matrix, In.vPosition );
			Out.vColor		= In.vColor;
		    return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShaderDebugLines
	[[
		float4 main( VS_OUTPUT In ) : PDX_COLOR
		{
		    return In.vColor;
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

Effect DebugLines
{
	VertexShader = "VertexShaderDebugLines"
	PixelShader = "PixelShaderDebugLines"
}