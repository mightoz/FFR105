function [speed,brakeTemperature] = TruckModel(currentSpeed,brakePressure,slopeGradient,currentBrakeTemperature,deltaT,gear)

  g = 9.81;
  m = 20000;
  tb = currentBrakeTemperature;
  tMax = 750;
  tAmb = 283;
  pp = brakePressure;
  tao = 30;
  ch = 40;
  cb = 3000;
  td = tb-tAmb;
  
  fg = CalculateForceOfGravity();
  fb = CalculateFoundationBrakeForce();
  feb = CalculateEngineBrakeForce();
  
  newSpeed = (fg-fb-feb)/m*deltaT + currentSpeed;
  newTemp = CalculateNewTemp();
  
  speed = newSpeed;
  brakeTemperature = newTemp;

   
  function newTemp = CalculateNewTemp()  
    if pp < 0.01
      newTemp = -td/tao*deltaT;
    else
      newTemp = ch*pp*deltaT;
    end
  end
  
  function fg = CalculateForceOfGravity()
    fg = m*g*sin(slopeGradient);
  end
  
  function fb = CalculateFoundationBrakeForce()
    if tb < (tMax-100)
      fb = m*g/20*pp;
    else
      fb = m*g/20*pp*exp(-(tb-(tMax-100))/100);
    end
  end

  function feb = CalculateEngineBrakeForce()
    switch gear
      case 1
        feb = cb*7;
      case 2
        feb = cb*5;
      case 3
        feb = cb*4;
      case 4
        feb = cb*3;
      case 5
        feb = cb*2.5;
      case 6
        feb = cb*2;
      case 7
        feb = cb*1.6;
      case 8
        feb = cb*1.4;
      case 9
        feb = cb*1.2;
      case 10
        feb = cb;
      otherwise
        error('Invalid gear: '+gear)
    end
  end  

end
  