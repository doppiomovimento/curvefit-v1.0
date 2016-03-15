function opos = jpositionfigure(par,kid)

        kidpos          = get(kid,'OuterPosition');
        opos            = kidpos;
        hlvl            = 0.85;

switch par
    case 0
        parpos          = get(par,'ScreenSize');
        if kidpos(3)>parpos(3)
            opos(1)     = 1;
        else
            opos(1)     = floor(parpos(3)/2 - kidpos(3)/2);
        end
        if kidpos(4)>(hlvl*parpos(4))
            if (kidpos(4)+(1-hlvl)*parpos(2))>parpos(4)
                opos(2) = parpos(4)- kidpos(4);
            else
                opos(2) = ceil(parpos(4)/2+kidpos(4)/2);
            end
        else
            opos(2)     = ceil(hlvl*parpos(4)-kidpos(4));
        end
    otherwise
        parpos          = get(par,'OuterPosition');
        opos(1)         = floor(parpos(1)+parpos(3)/2-kidpos(3)/2);
        opos(2)         = ceil(parpos(2)+hlvl*parpos(4)-kidpos(4));
end
