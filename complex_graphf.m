function complex_graphf(handles)

  y_string = get(handles.edit3,'string'); %
  x_string = get(handles.edit2,'string'); %
  f_string = get(handles.edit1,'string'); %

  tMin = str2num(get(handles.edit4,'string')); %
  tMax = str2num(get(handles.edit5,'string'));%
  npts = 200*(floor(abs(tMax-tMin)));

  t = linspace(tMin,tMax,npts);

  eval(['y = @(t) ', y_string, ';']);
  eval(['x = @(t) ', x_string, ';']);
  eval(['f = @(z) ', f_string, ';']);

  for it = 1:length(t)
    a(it) = x(t(it)) + i*y(t(it));
    w(it) = f(a(it));
  end


  a_x = real(a);
  a_y = imag(a);

  w_x = real(w);
  w_y = imag(w);

  maxVal = 1.5*max([abs(a_x),abs(a_y),abs(w_x),abs(w_y)]);

  if get(handles.radiobutton1,'Value')
    for ai = 1:length(t)
      plot(handles.axes1,[-maxVal,maxVal],[0,0],'k',[0,0],[-maxVal,maxVal],'k',a_x(1:ai),a_y(1:ai),'r' ...
      ,a_x(ai),a_y(ai),'*b');
      axis(handles.axes1,[-maxVal maxVal -maxVal maxVal])

      plot(handles.axes2,[-maxVal,maxVal],[0,0],'k', [0,0],[-maxVal,maxVal],'k',w_x(1:ai),w_y(1:ai),'r' ...
      ,w_x(ai),w_y(ai),'*b');
      axis(handles.axes2,[-maxVal maxVal -maxVal maxVal])
      pause(.005)
    end
  end

  plot(handles.axes1,[-maxVal,maxVal],[0,0],'k',[0,0],[-maxVal,maxVal],'k',a_x,a_y,'r');
  axis(handles.axes1,[-maxVal maxVal -maxVal maxVal])

  plot(handles.axes2,[-maxVal,maxVal],[0,0],'k',[0,0],[-maxVal,maxVal],'k',w_x,w_y,'r');
  axis(handles.axes2,[-maxVal maxVal -maxVal maxVal])
  clc;clear;
end
