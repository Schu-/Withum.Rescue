# Withum Rescue

This project is a simple Datto RMM component that creates a local Withum Rescue (wrescue) account. The component allows you to create, update, and delete the rescue account. Please see below for the setup of the component and how it can be used.

## Withum Rescue Datto Setup
This component requires 2 variables to be setup in the Datto RMM to actually perform the task and setup the password for the account. 

1. Create the rescue component in the Datto RMM system.
2. Setup the following settings.
    - Category: Scripts
    - Script: Powershell
3. Dump the powershell script into the Datto RMM script field.
4. Setup the following variables (Name | Type | Default Value):
 - rescueTask | Selection | Create/Update (Value: create_update)
 - rescueTask | Selection | Delete (Value: delete)
![rescueTask img](https://github.com/Schu-/Withum.Rescue/blob/54c4bfc02c2691f29ef594e51c2e68c0fcc567c4/img/rescueTask.png)
 - rescuePass | String | Welcome1!#
![Variables img](https://github.com/Schu-/Withum.Rescue/blob/54c4bfc02c2691f29ef594e51c2e68c0fcc567c4/img/rescueVariables.png)

5. Save component to be used.


