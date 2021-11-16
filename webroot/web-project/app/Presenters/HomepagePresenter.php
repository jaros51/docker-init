<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use Tracy\Debugger;

final class HomepagePresenter extends Nette\Application\UI\Presenter
{
    private Nette\Database\Explorer $database;

	public function __construct(Nette\Database\Explorer $database)
	{
		$this->database = $database;
	}

    public function renderDefault(): void
    {
        $this->template->products = $this->database->table('products')
            ->order('created');

        // use Tracy\Debugger;

        // Koniec merania casoveho useku v requeste
        $this->template->reqTime = $reqTime = Debugger::timer('reqTime') * 1000;
        // Ulozenie casu do DB
        $this->database->table('stats')->insert(['time' => $reqTime]);
        // Vytiahnutie pocetnosti a priemer casov z DB
        $this->template->statsAvg = $this->database->table('stats')
            ->select('COUNT(time) AS count_times, AVG(time) AS avg')
            ->fetch();
    }
}
