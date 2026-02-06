unit main_class;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, pw_utils, LazLogger;


const
    // Range Variables
    genericLowerCase : String = 'abcdefghijklmnñopqrstuvwxyz';
    genericUpperCase : String = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ';
    genericNumbers   : String = '1234567890';
    genericSpecials  : String = '!@*-_^~()[]{}|$:';

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
	    passLength : Integer;
		charPoolLength : Integer;
		charPool : String;
	end;
	{ END : TPWProcessData RECORD }

function generatePassword(const PWData : TPWData ) : String;
function generateCharPool(const PWData : TPWData ) : String;
function generate(const processData : TPWProcessData ) : String;

var
    substring : String;
    processData: TPWProcessData = (passLength : 0; charPoolLength : 0; charPool : '');

implementation


function generatePassword(const PWData : TPWData ) : String ;
begin
    processData.passLength := pw_utils.getRandomIntBetweenRange(PWData.pwmin_size, PWData.pwmax_size);
	processData.charPool := generateCharPool(PWData);
	processData.charPoolLength := Length(processData.charPool);
    Result := generate(processData);
end;

function generateCharPool(const PWData : TPWData) : String;
var
    charPool : String;
begin
    charPool := '';
    if(PWData.LWCASE) then
	    charPool := charPool + genericLowerCase;

	if(PWData.UPPCASE) then
	    charPool := charPool + genericUpperCase;

	if(PWData.numbers) then
	    charPool := charPool + genericNumbers;

	if(PWData.special) then
	    charPool := charPool + genericSpecials;

	Result := charPool;
end;

function generate(const processData : TPWProcessData) : String;
var
    generatedPassword : String;
	i : Integer;
begin
    generatedPassword := '';
    for i := 1 to processData.passLength do
	    generatedPassword := generatedPassword + processData.charPool[ Random(processData.charPoolLength) + 1 ];

	Result := generatedPassword;
end;

end.

