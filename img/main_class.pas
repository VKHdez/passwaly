unit main_class;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils;

const
    // Range Variables
    genericLowerCase : String = 'abcdefghijklmnopqrstuvwxyz';
    genericUpperCase : String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    PWGENERICNUMBERARRAY    : String = '1234567890';
    PWGENERICSPECIALARRAY   : String = '!#$%&+@.,;-=';

type

    { TPWData RECORD }
    TPWData = record
        pwmin_size, pwmax_size : Integer;   // Both 9
        LWCASE, UPPCASE : boolean;         // Both False
        numbers : boolean;                  // True
        special : boolean;                  // False
    end;
	{ END : TPWData RECORD }

	{ TPWProcessData RECORD }
	TPWProcessData = record
	    pass_length := Integer;
	end;
	{ END : TPWProcessData RECORD }

	procedure generatePassword(PWData : TPWData ) : String;

var
   substring : String;

implementation


procedure generatePassword(const PWData : TPWData );
begin


end;

end.

