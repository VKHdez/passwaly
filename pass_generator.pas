
{ ************************************************* }
{ This program is under GNUGPL                      }
{ ************************************************* }
{ Created by: Victor Hdez                           }
{ Date: 16 / 03 / 2020                              }

unit pass_generator;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  Menus, ExtCtrls, MaskEdit, main_class, about_view, Clipbrd;

type

	{ Tmain_form }
    {
        Main access form
    }
    Tmain_form = class(TForm) { -- 'Tmain_form' CLASS -- }
			  copy_label: TLabel;
        // Main Menu
        main_menu: TMainMenu;
            help_menu: TMenuItem;
            help_item: TMenuItem;
			max_pass_length_text: TLabel;

        // Top Group
        min_pass_length: TEdit; min_pass_lenght_text: TLabel;

        max_pass_length: TEdit; max_pass_lenght_text: TLabel;

        check_size: TCheckBox;

        config_group_box: TGroupBox; // Group Box

        // Botton Group
        check_special: TCheckBox;
	    check_lower: TCheckBox;
	    check_upper: TCheckBox;
	    check_number: TCheckBox;
		min_pass_length_text: TLabel;

        // RESULTS

		pass_result_field: TMaskEdit;
        Generate: TBitBtn;

        show_pass: TBitBtn;
    	copy_pass: TBitBtn;

        // --- PROCEDURES
		procedure check_lowerChange(Sender: TObject);
		procedure check_numberChange(Sender: TObject);
        procedure check_sizeChange(Sender: TObject);
		procedure check_specialChange(Sender: TObject);
		procedure check_upperChange(Sender: TObject);
		procedure copy_passClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
		procedure GenerateClick(Sender: TObject);
		procedure help_itemClick(Sender: TObject);
		procedure max_pass_lengthChange(Sender: TObject);
		procedure min_pass_lengthChange(Sender: TObject);

	    private
		    procedure initDefaults;
        public
    end; { -- END: FORM CLASS -- }

var // LOCAL VARIABLES
    main_form: Tmain_form;
    PWData : TPWData = ( pwmin_size:9; pwmax_size :9; LWCASE :False; UPPCASE :False; numbers :True; special :True; );

implementation

{$R *.lfm}

{ Tmain_form }
{ Procedure called when form is created}
procedure Tmain_form.FormCreate(Sender: TObject);
begin
    initDefaults;
end;

{ Init default form values }
procedure Tmain_form.initDefaults();
begin
    { Setting up Max, Min values }
	min_pass_length.Text := IntToStr(PWData.pwmin_size);
	max_pass_length.Text := IntToStr(PWData.pwmax_size);
    { Setting up checks }
    check_lower.Checked := PWData.LWCASE;
	check_upper.Checked := PWData.UPPCASE;
	check_number.Checked := PWData.numbers;
	check_special.Checked := PWData.special;
end;

{ If 'check_size' then disabled min_pass_length }
procedure Tmain_form.check_sizeChange(Sender: TObject);
begin
    if (check_size.Checked) then begin
	    { Disabled both min_pass_length input and label }
        min_pass_length_text.Enabled := false;
        min_pass_length.Enabled      := false;
		min_pass_length.Text         := max_pass_length.Text;
		PWData.pwmin_size            := PWData.pwmax_size;
    end else begin
	    { Enable otherwise }
        min_pass_length_text.Enabled := true;
        min_pass_length.Enabled      := true;
		min_pass_length.Text         := IntToStr( PWData.pwmin_size );
    end;
end;

{ Enable/Disable special chars for pass generation }
procedure Tmain_form.check_specialChange(Sender: TObject);
begin
    PWData.special := check_special.Checked;
end;

{ Enable/Disable upper case letters for pass generation }
procedure Tmain_form.check_upperChange(Sender: TObject);
begin
    PWData.UPPCASE := check_upper.Checked;
end;

{ Copy the generated password to the clipboard }
procedure Tmain_form.copy_passClick(Sender: TObject);
var
    finalPassLength : Integer;
begin
    finalPassLength := Length(pass_result_field.Text);
    if( finalPassLength > 0) then begin
	    Clipboard.AsText := pass_result_field.Text;
		copy_label.Font.Color := clGreen;
		copy_label.Caption := 'Password copied to your system clipboard...';
		copy_label.Visible := True;
	end else begin
		copy_label.Font.Color := clRed;
		copy_label.Caption := 'There is not password generated...';
		copy_label.Visible := True;
	end;
end;

{ Enable/Disable lower case letters for pass generation }
procedure Tmain_form.check_lowerChange(Sender: TObject);
begin
    PWData.LWCASE := check_lower.Checked;
end;

{ Enable/Disable numbers for pass generation }
procedure Tmain_form.check_numberChange(Sender: TObject);
begin
    PWData.numbers := check_number.Checked;
end;

procedure Tmain_form.max_pass_lengthChange(Sender: TObject);
begin
    PWData.pwmax_size := StrToIntDef(max_pass_length.Text,0);
end;

procedure Tmain_form.min_pass_lengthChange(Sender: TObject);
begin
    PWData.pwmin_size := StrToIntDef(min_pass_length.Text,0);
end;

{ Generate password }
procedure Tmain_form.GenerateClick(Sender: TObject);
begin
    pass_result_field.Text := main_class.generatePassword(PWData);
end;

procedure Tmain_form.help_itemClick(Sender: TObject);
begin
    AboutForm.ShowModal;
end;

end. { END PROGRAM }

