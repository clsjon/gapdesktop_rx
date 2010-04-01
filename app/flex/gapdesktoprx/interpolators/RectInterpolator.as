package gapdesktoprx.interpolators
{
import spark.effects.interpolation.IInterpolator;
import flash.geom.Rectangle;

public class RectInterpolator implements IInterpolator
{
    public function RectInterpolator()
    {
    }
    
    public function interpolate(fraction:Number, startValue:Object, endValue:Object):Object
    {
        return new Rectangle(startValue.x + fraction * (endValue.x - startValue.x),
            startValue.y + fraction * (endValue.y - startValue.y),
            startValue.width + fraction * (endValue.width - startValue.width),
            startValue.height + fraction * (endValue.height - startValue.height));
    }
    
    public function increment(baseValue:Object, incrementValue:Object):Object
    {
        return new Rectangle(baseValue.x + incrementValue.x,
            baseValue.y + incrementValue.y,
            baseValue.width + incrementValue.width,
            baseValue.height + incrementValue.height);
    }
    
    public function decrement(baseValue:Object, decrementValue:Object):Object
    {
        return new Rectangle(baseValue.x - decrementValue.x,
            baseValue.y - decrementValue.y,
            baseValue.width - decrementValue.width,
            baseValue.height - decrementValue.height);
    }
}
}