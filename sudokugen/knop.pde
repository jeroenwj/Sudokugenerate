boolean begin = false;
//Dit is de gebruikte class voor de knop in ons GUI.

class MyButton extends Controller {

  int current = 0xffff0000;
  float a = 128;
  float na =180;
  int y;

  MyButton(ControlP5 cp5, String theName) {
    super(cp5, theName);
    //Dit stukje code zorgt voor het grafisch maken van de knop.
    setView(new ControllerView() {
      public void display(PGraphics p, Object b) {
        p.fill(current, na);
        p.rect(0, 0, getWidth(), getHeight());
        translate(0, getHeight()+14);
        p.text(getName(), 0, 0);
      }
    }
    );
  }
  
//Hieronder word aangegeven wat er gebeurd wanneer je muis op of over de knop heen beweegt.
//En wat er gebeurt wanneer je op de knop drukt en erin/buiten de knop los laat.
  void onEnter() { cursor(HAND);}
  void onClick() {begin = true;g=0;}

  void onReleaseOutside() {onLeave();}

  void onLeave() {cursor(ARROW);}
}