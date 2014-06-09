
import java.util.Timer;
import java.util.TimerTask;
import processing.core.PApplet;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;


class Schedule {
  
  Timer timer = new Timer();
  PApplet parent;
  
  Schedule(PApplet app) {
    parent = app; 
  }

  // task for calling the method of an object
  class Task extends TimerTask {
    
    String method;
    Object target;
    
    Task(String method, Object target) {
      this.method = method;
      this.target = target;
    }
    
    // call the method of the targer
    public void run() {
      method(method, target);
    }
    
    // nice display for the console
    public String toString() {
      if (target == parent) {
        return method + "()"; 
      } else {
        return getRelativeClassName(target.getClass(), parent.getClass()) + "." + method + "()" + " of " + target;
      }
    }    

    
  }
  

  // schedule a task for a certain time after the sketch was started
  void add(int time, Task task) {
    
    int now = parent.millis();
    int delta = time - now;
    
    if(delta > 0) {
      timer.schedule(task, delta);
    } else {
      // too late... 
      System.err.println("SKIPPING TASK " + task + " at " + delta + " ms from now");
    }
    
  }


  // schedule method call by name
  void add(int time, String method) {
    add(time, method, parent);
  }


  // schedule method call by name + target
  void add(int time, String method, Object target) {
    Task task = new Task(method, target);
    add(time, task);
  }
  
  // helper function ...
  private static String getRelativeClassName(Class<?> inner, Class<?> outer) {
    int length = outer.getCanonicalName().length();
    return inner.getCanonicalName().substring(length+1);
  }
    
  // extend processing's method() to handle target classes
  private void method(String name, Object target) {
    try {
      Method method = target.getClass().getMethod(name, new Class[] {});
      method.invoke(target, new Object[] { });
  
    } catch (IllegalArgumentException e) {
      e.printStackTrace();
    } catch (IllegalAccessException e) {
      e.printStackTrace();
    } catch (InvocationTargetException e) {
      e.getTargetException().printStackTrace();
    } catch (NoSuchMethodException nsme) {
      System.err.println("There is no public " + name + "() method " +
                         "in the class " + getClass().getName());
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  
}


