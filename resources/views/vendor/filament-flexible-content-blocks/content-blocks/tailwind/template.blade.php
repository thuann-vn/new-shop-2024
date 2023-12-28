@if($template)
    <div class="py-12">
        <div class="container mx-auto">
            @include($template, ['record' => $record])
        </div>
    </div>
@endif
