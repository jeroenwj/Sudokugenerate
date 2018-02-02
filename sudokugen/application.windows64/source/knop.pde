boolean begin = false;
class MyButton extends Controller {

  int current = 0xffff0000;

  float a = 128;
  
  float na =180;
  
  int y;
  
  // use the convenience constructor of super class Controller
  // MyButton will automatically registered and move to the 
  // default controlP5 tab.
  
  MyButton(ControlP5 cp5, String theName) {
    super(cp5, theName);
    
    // replace the default view with a custom view.
    setView(new ControllerView() {
      public void display(PGraphics p, Object b) {
        // draw button background
 
        p.fill(current,na);
        p.rect(0, 0, getWidth(), getHeight());
        

       translate(0,getHeight()+14);
        p.text(getName(),0,0);

        
      }
    }
    );
  }

  // override various input methods for mouse input control
  void onEnter() {
    cursor(HAND);

  }
 
  void onClick() {
    begin = true;
    g=0;
  }
 
  void onReleaseOutside() {
    onLeave();
  }

  void onLeave() {
    cursor(ARROW);
  }
}