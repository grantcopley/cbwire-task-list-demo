<cfoutput>
<div class="h-100 w-full flex items-center justify-center bg-teal-lightest font-sans">
	<div
        class="bg-white rounded shadow p-6 m-4 w-full lg:max-w-3xl">
        <div class="mb-4">
            <div class="flex justify-between">
                <div>
                    <h1 class="text-grey-darkest text-3xl">Task List</h1>
                    <div class="ml-1">Powered by <a class="text-cyan-500" href="https://cbwire.ortusbooks.com">cbwire</a></div>
                </div>
                <!--- COMPUTED PROPERTIES --->
                <div>
                    <div>#args.taskCounter()# tasks</div>
                    <div>#args.completeCounter()# complete</div>   
                </div>
            </div>
            <div class="flex mt-4">
                <!--- MODEL DATA BINDING --->
                <input
                    wire:model.debounce.300ms="task"
                    class="shadow appearance-none border rounded w-full py-2 px-3 mr-4 text-grey-darker" placeholder="Add Task">
                <!--- ADDTASK ACTION --->
                <button
                    <cfif args.preventAdd()>disabled</cfif>
                    wire:click="addTask"
                    class="<cfif args.preventAdd()>bg-gray-500<cfelse>bg-cyan-500 hover:bg-cyan-600</cfif> px-2.5 py-1.5 border border-transparent font-medium text-cs shadow-sm rounded text-white hover:text-white">Add</button>
            </div>
            <div class="text-sm italic text-rose-600">
                <cfif len( args.error )>
                    #args.error#
                </cfif>
            </div>
        </div>
        <div>
            <!--- #serializeJson( args.tasks )# --->
            <cfif arrayLen( args.tasks )>
                <div>
                    <a class="text-sm italic text-cyan-500" href="##" wire:click="removeAll">Remove All</a>
                </div>
            </cfif>
            <div>
                <cfloop array="#args.tasks#" index="task">
                    #wire( "Task", { "task": task } )#
                </cfloop>
            </div>
        </div>
    </div>
</div>
</cfoutput>