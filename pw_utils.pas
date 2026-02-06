unit pw_utils;

{$mode ObjFPC}{$H+}

interface

uses
      Classes, SysUtils, Math;

function getRandomIntBetweenRange(const minValue : Integer; const maxValue : Integer) : Integer;

implementation

function getRandomIntBetweenRange(const minValue : Integer; const maxValue : Integer) : Integer;
begin
    Result := RandomRange(minValue, maxValue);
end;

end.

