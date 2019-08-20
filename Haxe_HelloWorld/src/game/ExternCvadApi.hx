package game;
import gml.Instance;
import gml.Mathf;
import gml.RawAPI;

/**
 * ...
 * @author Gavolot
 */
@:keep
class ExternCvadApi extends Instance
{
	public function init() {
		this.image_xscale = 0;
		this.image_yscale = 0;
	}
	public function step() {
		this.image_xscale = this.image_xscale < 1 ? this.image_xscale + 0.025 : 0;
		this.image_yscale = this.image_yscale < 1 ? this.image_yscale + 0.025 : 0;
	}
	public function draw() {
		RawAPI.draw_self();
	}
	
}