apellido = 'placa_ALVAREZ'; 
path = 'C:\Users\Usuario\Desktop\TESIS\Contornos\SEGMENTOS_MIRANDA\';

placa_d = load(strcat(path,apellido,'_D'));
placa_s = load(strcat(path,apellido,'_S'));

seg_d = placa_d.area;
seg_s = placa_s.area;
cont_d = placa_d.p;
cont_s = placa_s.p;



COP_d = cont_d(:);
COP_s = cont_s(:);
COP_CM_d = CM_placa(cont_d);
COP_CM_s = CM_placa(cont_s);


[FD_d] = Higuchi(COP_d)
[FD_CM_d] = Higuchi(COP_CM_d)
[FD_s] = Higuchi(COP_s)
[FD_CM_s] = Higuchi(COP_CM_s)