unit about_view;

{$mode ObjFPC}{$H+}

interface

uses
      Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

	  { TAboutForm }

      TAboutForm = class(TForm)
			author_label: TLabel;
			name_label: TLabel;
			version_label: TLabel;
			passwally_logo: TImage;
			description_label: TLabel;
      private

      public

      end;

var
      AboutForm: TAboutForm;

implementation

{$R *.lfm}

{ TAboutForm }

end.

