<apply template="base">
  <bind tag="body-main">
    <div class="container max-w-screen-md mx-auto my-8 flex flex-col items-center justify-center">
      <bind tag="linkClass">underline</bind>

      <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md w-full flex flex-col space-y-4 text-gray-600 dark:text-gray-300">
        <!-- Header: name, location, title, email, avatar -->
        <div id="__TOP__"
          class="flex flex-row items-start justify-between space-x-4 w-full px-4 py-6 rounded-t bg-rose-300 dark:bg-rose-500 text-white">
          <div>
            <header class="font-bold text-3xl">
              Ruixi-rebirth
            </header>
            <div class="text-gray-100">
              <a class="${linkClass}" title="EST"
                href="https://www.timeanddate.com/time/zone/china/yunnan">Zhaotong City</a>, China
            </div>
            <div class="font-bold mt-4">
              Web3 Engineer
            </div>
            <div class="font-bold mt-4">
              Email:
              <a class="${linkClass}" title="send email"
                href="https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&to=ruixirebirth@gmail.com">ruixirebirth@gmail.com</a>
            </div>
          </div>
          <div class="w-24">
            <ema:metadata>
              <with var="template">
                <img src="${value:iconUrl}" class="rounded-full object-cover">
              </with>
            </ema:metadata>
          </div>
        </div>

        <!-- Personal Summary (TODO) -->
        <div id="__SUMMARY__" class="px-4 py-4  flex flex-col space-y-4 text-xl text-gray-900 dark:text-gray-100 font-bold">
          <p class="leading-snug">
             Update personal summary to highlight Web3/blockchain direction
             <!-- TODO: Update personal summary to highlight Web3/blockchain direction, AI-assisted development, Tech stack to mention, passion for Web3/blockchain.<-->
          </p>
        </div>

        <!-- Main Content Area -->
        <div id="__MAIN__" class="px-4 py-6 flex flex-col space-y-4 pt-4 text-gray-600 dark:text-gray-300">

          <!-- Open Source -->
          <section>
            <apply template="cv/company">Open Source</apply>
            <p class="font-serif mb-2">Open source contribution has been a consistent theme in my professional journey.
My recent Rust-based projects include:</p>
            <ul class="list-disc pl-4 mb-2 space-y-1">
              <li><a class="${linkClass}" href="xxx">xxx</a></li>
              <li><a class="${linkClass}" href="xxx">xxx</a></li>
            </ul>
            <p class="font-serif">Visit <a class="${linkClass}" href="https://github.com/Ruixi-rebirth">my GitHub profile</a> for
              a full portfolio of projects.</p>
          </section>

          <!-- Work Experience (generic template, each job as a separate block) -->
          <section>
            <apply template="cv/company">Work Experience</apply>

            <!-- Work experience entry template - copy this structure for each job -->
            <!--
              TODO: Replace with real work experience. Each job as a separate block, ordered reverse-chronologically.
              Suggested format:
              <div class="mb-4">
                <div class="flex justify-between items-baseline">
                  <span class="font-bold text-gray-800 dark:text-gray-200">Job Title</span>
                  <span class="text-sm text-gray-500 dark:text-gray-400">Time Period</span>
                </div>
                <div class="text-sm text-gray-600 dark:text-gray-400 mb-1">Company Name · Location (optional)</div>
                <ul class="list-disc pl-4 text-gray-600 dark:text-gray-300 space-y-1">
                  <li>Responsibility/Achievement 1</li>
                  <li>Responsibility/Achievement 2</li>
                  <li>Tech stack: Rust, Nix, TypeScript, etc.</li>
                </ul>
              </div>
            -->

            <div class="mb-4">
              <div class="flex justify-between items-baseline">
                <span class="font-bold text-gray-800 dark:text-gray-200">Blockchain Engineer</span>
                <span class="text-sm text-gray-500 dark:text-gray-400"><apply template="cv/year">June 2020</apply> – <apply template="cv/year">August 2022</apply></span>
              </div>
              <div class="text-sm text-gray-600 dark:text-gray-400 mb-1">company name · xx City, China</div>
              <ul class="list-disc pl-4 text-gray-600 dark:text-gray-300 space-y-1">
                <li>Responsibility, Achievement 1</li>
                <li>Responsibility, Achievement 2</li>
                <li>Tech stack: Rust, Nix, smart contracts, others</li>
              </ul>
            </div>

            <!-- More jobs can be added... -->

            <!-- Hint: If you don't have much formal work experience, you can rename to "Internship Experience" or "Project Experience" -->
          </section>

          <!-- Education (optional, can be placed here or in a separate section) -->
          <!-- <section> ... </section> -->

        </div>

        <!-- Miscellaneous Info (TODO) -->
        <div id="__ASIDE__" class="bg-pink-50 dark:bg-gray-700 px-4 py-6 flex flex-col space-y-4 pt-4 text-gray-600 dark:text-gray-300">
          <section>
            <apply template="cv/company">Misc facts</apply>
            <p>TODO: Personal facts - update.
                <!--
              TODO: Replace with MY actual information

              [Languages]
              - What languages do I actually speak? (native, fluent, etc.)

              [Education]
              - Where did I study? What degree?
              - Any certifications?

              [Location]
              - Where do I currently live?
              - Any relocation story worth mentioning?

              [Interests]
              - What am I genuinely passionate about?
              - Tech interests? Non-tech hobbies?
            -->
            </p>
          </section>
        </div>

      </div>
    </div>
  </bind>
</apply>
