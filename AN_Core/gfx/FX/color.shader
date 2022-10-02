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
    float2 vPosition  : POSITION;
 	float4 vColor	  : PDX_COLOR;
};


VertexStruct VS_OUTPUT
{
    float4  vPosition : PDX_POSITION;
	float4  vColor	  : TEXCOORD1;
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
	MainCode VertexColor
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
		    VS_OUTPUT Out;
			float4 vPosition = float4( v.vPosition.x, v.vPosition.y, 0, 1 );
		    Out.vPosition  	= mul( Matrix, vPosition );	
			Out.vColor		= v.vColor;
		    return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelColor
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    return v.vColor;
		}
	]]

}


## Blend States

## Rasterizer States

## Depth Stencil States

## Effects

Effect Color
{
	VertexShader = "VertexColor"
	PixelShader = "PixelColor"
}