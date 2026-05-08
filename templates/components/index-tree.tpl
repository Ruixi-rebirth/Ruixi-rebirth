<!-- Variable bindings for this tree-->
<bind tag="link-class">hover:bg-primary-50 dark:hover:bg-primary-950 hover:text-primary-700 dark:hover:text-primary-300 transition-colors</bind>
<node:active>
  <bind tag="link-class">font-semibold bg-primary-50 dark:bg-primary-950 text-primary-700 dark:text-primary-300 hover:bg-primary-100 dark:hover:bg-primary-900 transition-colors</bind>
  <else />
  <node:activeTree>
    <has-current-route>
      <bind tag="link-class">font-semibold hover:bg-primary-50 dark:hover:bg-primary-950 hover:text-primary-700 dark:hover:text-primary-300 transition-colors</bind>
    </has-current-route>
  </node:activeTree>
</node:active>

<has-children>
  <bind tag="icon">
    <svg viewBox="0 0 24 24" class="index-icon-chevron w-5 h-5 flex-shrink-0 inline text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
      <polyline points="6 9 12 15 18 9"></polyline>
    </svg>
  </bind>
  <else />
  <bind tag="icon">
    <span class="block w-1 h-1 rounded-full bg-gray-300 dark:bg-gray-700"></span>
  </bind>
</has-children>

<div class="pl-2">
  <has-children>
    <details>
      <summary class="index-tree-summary flex items-center my-1.5 space-x-1 justify-left">
        <span class="flex-shrink-0"><icon /></span>
        <a class="${link-class} rounded-md px-2 py-1 truncate flex-1" title="${node:text}" href="${node:url}"
           onclick="event.stopPropagation()">
          <node:text />
        </a>
        <span class="text-xs text-gray-400 dark:text-gray-500 flex-shrink-0" title="${tree:childrenCount} children inside">
          <tree:childrenCount />
        </span>
      </summary>
      <div class="ml-4 border-l border-gray-200 dark:border-gray-700">
        <children>
          <apply template="index-tree" />
        </children>
      </div>
    </details>
    <else />
    <div class="flex items-center my-1.5 space-x-1 justify-left">
      <span class="flex-shrink-0"><icon /></span>
      <a class="${link-class} rounded-md px-2 py-1 truncate flex-1" title="${node:text}" href="${node:url}">
        <node:text />
      </a>
    </div>
  </has-children>
</div>
