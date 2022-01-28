<cfoutput>
    <div class="flex mb-4 items-center">
        <p class="w-full text-grey-darkest <cfif args.task.complete>line-through</cfif>">#args.task.name#</p>
        <cfif args.task.complete>
            <button
                wire:click="reopen"
                class="bg-cyan-600 px-2.5 py-1.5 border border-transparent font-medium text-cs shadow-sm rounded text-white hover:text-white hover:bg-cyan-700">Reopen</button>
        <cfelse>
            <button
                wire:click="complete"
                class="bg-cyan-500 px-2.5 py-1.5 border border-transparent font-medium text-cs shadow-sm rounded text-white hover:text-white hover:bg-cyan-600">Done</button>
        </cfif>
        <button
            wire:click="remove"
            class="ml-2 bg-rose-600 px-2.5 py-1.5 border border-transparent font-medium text-cs shadow-sm rounded text-white hover:text-white hover:bg-rose-700">Remove</button>
    </div>
</cfoutput>