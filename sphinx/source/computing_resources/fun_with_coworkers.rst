==================
Fun with Coworkers
==================

.. contents::
    :local:

Most of the information on this page comes from Dr. Bill Miller III at Truman State University.

In this section I have included some commands that are not extremely useful for 
productive work, but can make work more enjoyable by sending messages to 
your colleagues. 

Send a Message to All Users' Terminal Windows 
*********************************************

The ``wall`` command works very similar to the ``write`` command, 
except that instead of sending a message to only one person’s 
Terminal window, you send that message to every Terminal window 
open by all users currently logged into that computer, including 
yourself. To initiate a wall message, type 

.. code:: shell
    
    wall 

This will bring you to the next line in your Terminal window. You 
can write as much or as little as you want. You can press enter to 
go to another line even; so you can send a multi-line message. 
Once you are done drafting your message, press ``ctrl+D`` on your 
keyboard to end the wall command and send the message to all users.

Notice that ``wall`` was entered, the message was written, 
and then ``ctrl+D`` was pressed (which you can’t actually see) 
to terminate wall and send the message to everyone. After 
``ctrl+D`` was pressed, the message was also sent to my 
Terminal window, so the message shows up a second time after a 
Broadcast message that shows it was send from 
user me using the Terminal window ``pts/7``. Pressing enter after 
receiving the message will bring up the command prompt again in the 
Terminal window.

Send a Message to a User's Terminal Window 
******************************************
The ``write`` command gives a user the ability to send a message 
directly to another user’s terminal window on the same computer. 
Before you send a message to a user, you need to decide what 
Terminal window you want to send your message to. For this, you 
should use the ``who`` command. This will allow you to see who 
has a Terminal window open on that computer, along with dates 
and times to see when each Terminal was opened by the user. To send 
a message to one of the Terminal windows you can use the ``write`` 
command. The general syntax is

.. code:: shell

    write user window

For an example, if you want to send a message to a terminal called 
"pts/3" or a user named "theorysuite", I would type 

.. code:: shell

    write theorysuite pts/3

Once you hit enter to execute the command, you can type whatever 
you want as your message. You can press enter and it will continue 
to the next line (not send the message). When you are done typing 
your message and want to send it, press ``ctrl-D`` on the keyboard to 
end the command and send the message.

If the receiver of this message wants to send you a message back, 
they will need to know what Terminal window you are sending from 
so that you will see it on the same Terminal window you are 
writing from.