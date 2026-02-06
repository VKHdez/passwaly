program pass_generatorlpi;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pass_generator, main_class, pw_utils
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
	  Application.Scaled:=True;
  Application.Initialize;
	Application.CreateForm(Tmain_form, main_form);
  Application.Run;
end.

