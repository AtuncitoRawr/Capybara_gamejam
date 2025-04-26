function scrSlideTransition(_mode,_target)
{
          with(oTransition)
          {
                    mode = _mode;
                    target = _target;
                    if(argument_count > 1) _target = argument[1];
          }
}